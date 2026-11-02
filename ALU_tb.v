module ALU_tb;

    // --- Signal Declarations -------------------------------
    reg  [7:0] A, B;
    reg  [3:0] operator;
    wire [7:0] result;
    wire       carry, flag;
    wire       negtive, overflow;

    // --- Test Counter --------------------------------------
    integer pass_count = 0;
    integer fail_count = 0;

    // --- Opcodes (must match DUT) ---------------------------
    parameter ADD         = 4'b0000;
    parameter SUB         = 4'b0001;
    parameter AND         = 4'b0010;
    parameter OR          = 4'b0011;
    parameter XOR         = 4'b0100;
    parameter NOT         = 4'b0101;
    parameter SHIFT_RIGHT = 4'b0110;
    parameter SHIFT_LEFT  = 4'b0111;
    parameter COMP        = 4'b1000;

    // --- DUT Instantiation (WIDTH overridden to 8) ---------
    ALU #(.WIDTH(8)) dut (
        .A        (A),
        .B        (B),
        .operator (operator),
        .result   (result),
        .carry    (carry),
        .flag     (flag),
        .negtive  (negtive),
        .overflow (overflow)
    );

    // --- Check Task ----------------------------------------
    task check;
        input [7:0] exp_result;
        input       exp_carry;
        input       exp_flag;
        input       exp_negtive;
        input       exp_overflow;
        input [7:0] test_num;
        begin
            #10;
            if (result   === exp_result &&
                carry    === exp_carry  &&
                flag     === exp_flag   &&
                negtive  === exp_negtive &&
                overflow === exp_overflow)
            begin
                $display("TEST %02d PASSED | op=%b | A=%3d B=%3d | result=%3d carry=%b flag=%b negtive=%b overflow=%b",
                          test_num, operator, A, B, result, carry, flag, negtive, overflow);
                pass_count = pass_count + 1;
            end
            else begin
                $display("TEST %02d FAILED | op=%b | A=%3d B=%3d | expected result=%3d carry=%b flag=%b negtive=%b overflow=%b | got result=%3d carry=%b flag=%b negtive=%b overflow=%b",
                          test_num, operator, A, B,
                          exp_result, exp_carry, exp_flag, exp_negtive, exp_overflow,
                          result, carry, flag, negtive, overflow);
                fail_count = fail_count + 1;
            end
        end
    endtask

    // --- Stimulus ------------------------------------------
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, ALU_tb);
        $display("============================================");
        $display("           ALU TESTBENCH STARTING          ");
        $display("============================================");

        // -- ADD (op = 0000) -----------------------------
        // check(result, carry, flag, negtive, overflow, test_num)
        A=8'd1;   B=8'd3;   operator=ADD; check(8'd4,   1'b0, 1'b0, 1'b0, 1'b0, 1);
        A=8'd0;   B=8'd0;   operator=ADD; check(8'd0,   1'b0, 1'b1, 1'b0, 1'b0, 2); // flag asserts
        A=8'd255; B=8'd1;   operator=ADD; check(8'd0,   1'b1, 1'b1, 1'b0, 1'b0, 3); // unsigned carry, no signed overflow (-1+1=0)
        A=8'd128; B=8'd128; operator=ADD; check(8'd0,   1'b1, 1'b1, 1'b0, 1'b1, 4); // -128+-128 signed overflow
        A=8'd100; B=8'd55;  operator=ADD; check(8'd155, 1'b0, 1'b0, 1'b1, 1'b1, 5); // 100+55 signed overflow

        // -- SUBTRACT (op = 0001) ------------------------
        A=8'd10;  B=8'd3;   operator=SUB; check(8'd7,   1'b0, 1'b0, 1'b0, 1'b0, 6);
        A=8'd5;   B=8'd5;   operator=SUB; check(8'd0,   1'b0, 1'b1, 1'b0, 1'b0, 7); // flag asserts
        A=8'd0;   B=8'd1;   operator=SUB; check(8'd255, 1'b0, 1'b0, 1'b1, 1'b0, 8); // -1, negtive set
        A=8'd255; B=8'd100; operator=SUB; check(8'd155, 1'b0, 1'b0, 1'b1, 1'b0, 9); // -1-100=-101, negtive, no overflow
        A=8'd1;   B=8'd255; operator=SUB; check(8'd2,   1'b0, 1'b0, 1'b0, 1'b0, 10); // 1-(-1)=2, no overflow

        // -- AND (op = 0010) -----------------------------
        A=8'hFF; B=8'hFF; operator=AND; check(8'hFF, 1'b0, 1'b0, 1'b1, 1'b0, 11);
        A=8'hFF; B=8'h00; operator=AND; check(8'h00, 1'b0, 1'b1, 1'b0, 1'b0, 12); // flag asserts
        A=8'hAA; B=8'h55; operator=AND; check(8'h00, 1'b0, 1'b1, 1'b0, 1'b0, 13); // alternating bits
        A=8'hF0; B=8'h0F; operator=AND; check(8'h00, 1'b0, 1'b1, 1'b0, 1'b0, 14);
        A=8'hA5; B=8'hA5; operator=AND; check(8'hA5, 1'b0, 1'b0, 1'b1, 1'b0, 15);

        // -- OR (op = 0011) ------------------------------
        A=8'h00; B=8'h00; operator=OR; check(8'h00, 1'b0, 1'b1, 1'b0, 1'b0, 16); // flag asserts
        A=8'hFF; B=8'h00; operator=OR; check(8'hFF, 1'b0, 1'b0, 1'b1, 1'b0, 17);
        A=8'hAA; B=8'h55; operator=OR; check(8'hFF, 1'b0, 1'b0, 1'b1, 1'b0, 18); // alternating bits
        A=8'hF0; B=8'h0F; operator=OR; check(8'hFF, 1'b0, 1'b0, 1'b1, 1'b0, 19);
        A=8'hA5; B=8'h5A; operator=OR; check(8'hFF, 1'b0, 1'b0, 1'b1, 1'b0, 20);

        // -- XOR (op = 0100) -----------------------------
        A=8'hFF; B=8'hFF; operator=XOR; check(8'h00, 1'b0, 1'b1, 1'b0, 1'b0, 21); // same = zero
        A=8'h00; B=8'h00; operator=XOR; check(8'h00, 1'b0, 1'b1, 1'b0, 1'b0, 22); // flag asserts
        A=8'hAA; B=8'h55; operator=XOR; check(8'hFF, 1'b0, 1'b0, 1'b1, 1'b0, 23);
        A=8'hF0; B=8'h0F; operator=XOR; check(8'hFF, 1'b0, 1'b0, 1'b1, 1'b0, 24);
        A=8'hA5; B=8'h5A; operator=XOR; check(8'hFF, 1'b0, 1'b0, 1'b1, 1'b0, 25);

        // -- NOT (op = 0101) ------------------------------
        A=8'b00000001; B=8'h00; operator=NOT; check(8'b11111110, 1'b0, 1'b0, 1'b1, 1'b0, 26);
        A=8'b11111111; B=8'h00; operator=NOT; check(8'b00000000, 1'b0, 1'b1, 1'b0, 1'b0, 27); // flips to zero, flag
        A=8'b00001111; B=8'h00; operator=NOT; check(8'b11110000, 1'b0, 1'b0, 1'b1, 1'b0, 28);
        A=8'b01010101; B=8'h00; operator=NOT; check(8'b10101010, 1'b0, 1'b0, 1'b1, 1'b0, 29);
        A=8'b00000000; B=8'h00; operator=NOT; check(8'b11111111, 1'b0, 1'b0, 1'b1, 1'b0, 30);

        // -- SHIFT RIGHT (op = 0110) ----------------------
        A=8'b10000000; B=8'h00; operator=SHIFT_RIGHT; check(8'b01000000, 1'b0, 1'b0, 1'b0, 1'b0, 31);
        A=8'b00000001; B=8'h00; operator=SHIFT_RIGHT; check(8'b00000000, 1'b0, 1'b1, 1'b0, 1'b0, 32); // LSB lost, flag
        A=8'b11110000; B=8'h00; operator=SHIFT_RIGHT; check(8'b01111000, 1'b0, 1'b0, 1'b0, 1'b0, 33);
        A=8'b10101010; B=8'h00; operator=SHIFT_RIGHT; check(8'b01010101, 1'b0, 1'b0, 1'b0, 1'b0, 34);
        A=8'b00000000; B=8'h00; operator=SHIFT_RIGHT; check(8'b00000000, 1'b0, 1'b1, 1'b0, 1'b0, 35); // flag

        // -- SHIFT LEFT (op = 0111) -----------------------
        A=8'b00000001; B=8'h00; operator=SHIFT_LEFT; check(8'b00000010, 1'b0, 1'b0, 1'b0, 1'b0, 36);
        A=8'b01000000; B=8'h00; operator=SHIFT_LEFT; check(8'b10000000, 1'b0, 1'b0, 1'b1, 1'b0, 37); // becomes negative bit pattern
        A=8'b10000000; B=8'h00; operator=SHIFT_LEFT; check(8'b00000000, 1'b0, 1'b1, 1'b0, 1'b0, 38); // MSB shifted out, flag
        A=8'b01111111; B=8'h00; operator=SHIFT_LEFT; check(8'b11111110, 1'b0, 1'b0, 1'b1, 1'b0, 39);
        A=8'b00000000; B=8'h00; operator=SHIFT_LEFT; check(8'b00000000, 1'b0, 1'b1, 1'b0, 1'b0, 40); // flag

        // -- COMPARE (op = 1000) --------------------------
        A=8'd10;  B=8'd5;   operator=COMP; check(8'd1, 1'b0, 1'b0, 1'b0, 1'b0, 41); // A > B
        A=8'd5;   B=8'd10;  operator=COMP; check(8'd0, 1'b0, 1'b1, 1'b0, 1'b0, 42); // A < B, flag
        A=8'd5;   B=8'd5;   operator=COMP; check(8'd0, 1'b0, 1'b1, 1'b0, 1'b0, 43); // A = B, flag
        A=8'd255; B=8'd0;   operator=COMP; check(8'd1, 1'b0, 1'b0, 1'b0, 1'b0, 44); // max A
        A=8'd0;   B=8'd255; operator=COMP; check(8'd0, 1'b0, 1'b1, 1'b0, 1'b0, 45); // min A, flag

        // --- Summary -----------------------------------
        $display("============================================");
        $display("  RESULTS: %0d PASSED | %0d FAILED", pass_count, fail_count);
        $display("============================================");
        $finish;
    end

endmodule