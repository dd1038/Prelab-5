module sword (
    input logic clk,reset,in_secret_sword_stash, 
    output logic v
);

    logic sw;

    // D-Flip Flop for sword possession
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sw <= 1'b0; // Reset sword possession when reset is high
        end else if (in_secret_sword_stash) begin
            sw <= 1'b1; // Sword is found in Secret Sword Stash
        end
    end

    assign v = sw;

endmodule
