
//MÁQUINA DE ESTADOS PARA EL DATAPATH ORIGINAL
`timescale 1ns/1ns

module SM2 (
    reset,clock,SIGN,NOTLESS24,ZERO,COUT_FZ,
    LOAD1,LOAD2,LOAD3,LOAD4,LOAD5,LOAD6,CIN,CLEAR3,CLEAR4,COUNTD6,COUNTU6,FLAG_0,FLAG_1,ON21,ON22,SHIFTR3,SHIFTR4,SHIFTR5,DONE);

    input reset;
    input clock;
    input SIGN;
    input NOTLESS24;
    input ZERO;
    input COUT_FZ;
    tri0 reset;
    tri0 SIGN;
    tri0 NOTLESS24;
    tri0 ZERO;
    tri0 COUT_FZ;
    output LOAD1;
    output LOAD2;
    output LOAD3;
    output LOAD4;
    output LOAD5;
    output LOAD6;
    output CIN;
    output CLEAR3;
    output CLEAR4;
    output COUNTD6;
    output COUNTU6;
    output FLAG_0;
    output FLAG_1;
    output ON21;
    output ON22;
    output SHIFTR3;
    output SHIFTR4;
    output SHIFTR5;
    output DONE;
    reg LOAD1;
    reg LOAD2;
    reg LOAD3;
    reg LOAD4;
    reg LOAD5;
    reg LOAD6;
    reg CIN;
    reg CLEAR3;
    reg CLEAR4;
    reg COUNTD6;
    reg COUNTU6;
    reg FLAG_0;
    reg FLAG_1;
    reg ON21;
    reg ON22;
    reg SHIFTR3;
    reg SHIFTR4;
    reg SHIFTR5;
    reg DONE;
    reg [9:0] fstate;
    reg [9:0] reg_fstate;
    parameter S0=0,S1=1,S2=2,S3=3,S4=4,S5=5,S6=6,S7=7,S8=8,S9=9;

    always @(posedge clock)
    begin
        if (clock) begin
            fstate <= reg_fstate;
        end
    end

    always @(fstate or reset or SIGN or NOTLESS24 or ZERO or COUT_FZ)
    begin
        if (reset) begin
            reg_fstate <= S0;
            LOAD1 <= 1'b0;
            LOAD2 <= 1'b0;
            LOAD3 <= 1'b0;
            LOAD4 <= 1'b0;
            LOAD5 <= 1'b0;
            LOAD6 <= 1'b0;
            CIN <= 1'b0;
            CLEAR3 <= 1'b0;
            CLEAR4 <= 1'b0;
            COUNTD6 <= 1'b0;
            COUNTU6 <= 1'b0;
            FLAG_0 <= 1'b0;
            FLAG_1 <= 1'b0;
            ON21 <= 1'b0;
            ON22 <= 1'b0;
            SHIFTR3 <= 1'b0;
            SHIFTR4 <= 1'b0;
            SHIFTR5 <= 1'b0;
            DONE <= 1'b0;
        end
        else begin
            LOAD1 <= 1'b0;
            LOAD2 <= 1'b0;
            LOAD3 <= 1'b0;
            LOAD4 <= 1'b0;
            LOAD5 <= 1'b0;
            LOAD6 <= 1'b0;
            CIN <= 1'b0;
            CLEAR3 <= 1'b0;
            CLEAR4 <= 1'b0;
            COUNTD6 <= 1'b0;
            COUNTU6 <= 1'b0;
            FLAG_0 <= 1'b0;
            FLAG_1 <= 1'b0;
            ON21 <= 1'b0;
            ON22 <= 1'b0;
            SHIFTR3 <= 1'b0;
            SHIFTR4 <= 1'b0;
            SHIFTR5 <= 1'b0;
            DONE <= 1'b0;
            case (fstate)
                S0: begin
                    reg_fstate <= S1;

                    LOAD4 <= 1'b1;

                    LOAD3 <= 1'b1;

                    LOAD2 <= 1'b1;

                    LOAD1 <= 1'b1;
                end
                S1: begin
                    if ((SIGN == 1'b1))
                        reg_fstate <= S2;
                    else if (((SIGN == 1'b0) & (NOTLESS24 == 1'b1)))
                        reg_fstate <= S5;
                    else if ((((SIGN == 1'b0) & (NOTLESS24 == 1'b0)) & (ZERO == 1'b0)))
                        reg_fstate <= S6;
                    else if ((((SIGN == 1'b0) & (NOTLESS24 == 1'b0)) & (ZERO == 1'b1)))
                        reg_fstate <= S7;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= S1;

                    ON22 <= 1'b1;

                    FLAG_0 <= 1'b1;

                    CIN <= 1'b1;

                    LOAD6 <= 1'b1;
                end
                S2: begin
                    if ((NOTLESS24 == 1'b1))
                        reg_fstate <= S3;
                    else if (((NOTLESS24 == 1'b0) & (ZERO == 1'b0)))
                        reg_fstate <= S4;
                    else if (((NOTLESS24 == 1'b0) & (ZERO == 1'b1)))
                        reg_fstate <= S7;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= S2;

                    ON21 <= 1'b1;

                    FLAG_1 <= 1'b1;

                    CIN <= 1'b1;

                    LOAD6 <= 1'b1;
                end
                S3: begin
                    reg_fstate <= S7;

                    CLEAR3 <= 1'b1;
                end
                S4: begin
                    if ((ZERO == 1'b1))
                        reg_fstate <= S7;
                    else if ((ZERO == 1'b0))
                        reg_fstate <= S4;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= S4;

                    SHIFTR3 <= 1'b1;

                    COUNTD6 <= 1'b1;
                end
                S5: begin
                    reg_fstate <= S7;

                    CLEAR4 <= 1'b1;
                end
                S6: begin
                    if ((ZERO == 1'b0))
                        reg_fstate <= S6;
                    else if ((ZERO == 1'b1))
                        reg_fstate <= S7;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= S6;

                    SHIFTR4 <= 1'b1;

                    COUNTD6 <= 1'b1;
                end
                S7: begin
                    if ((COUT_FZ == 1'b1))
                        reg_fstate <= S8;
                    else if ((COUT_FZ == 1'b0))
                        reg_fstate <= S9;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= S7;

                    LOAD6 <= 1'b1;

                    LOAD5 <= 1'b1;
                end
                S8: begin
                    reg_fstate <= S9;

                    SHIFTR5 <= 1'b1;

                    COUNTU6 <= 1'b1;
                end
                S9: begin
                    reg_fstate <= S9;

                    DONE <= 1'b1;
                end
                default: begin
                    LOAD1 <= 1'bx;
                    LOAD2 <= 1'bx;
                    LOAD3 <= 1'bx;
                    LOAD4 <= 1'bx;
                    LOAD5 <= 1'bx;
                    LOAD6 <= 1'bx;
                    CIN <= 1'bx;
                    CLEAR3 <= 1'bx;
                    CLEAR4 <= 1'bx;
                    COUNTD6 <= 1'bx;
                    COUNTU6 <= 1'bx;
                    FLAG_0 <= 1'bx;
                    FLAG_1 <= 1'bx;
                    ON21 <= 1'bx;
                    ON22 <= 1'bx;
                    SHIFTR3 <= 1'bx;
                    SHIFTR4 <= 1'bx;
                    SHIFTR5 <= 1'bx;
                    DONE <= 1'bx;
                    $display ("Reach undefined state");
                end
            endcase
        end
    end
endmodule // SM2
