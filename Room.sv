module Room (
    input logic clk,n,s,e,w,reset,   

    output logic s6,win,s5,d,s4,s3,sw,s2,s1,s0
);

    // Internal state signals for each room
    logic state_cave_of_cacophony, state_twisty_tunnel, state_rapid_river, state_secret_sword_stash;
    logic state_dragon_den, state_victory_vault, state_grievous_graveyard;

    // Next state logic
    logic state_cave_of_cacophony_next, state_twisty_tunnel_next, state_rapid_river_next, state_secret_sword_stash_next;
    logic state_dragon_den_next, state_victory_vault_next, state_grievous_graveyard_next;

	 logic v;

    // Sword logic
    sword sword (
        .clk(clk),
        .reset(reset),
        .in_secret_sword_stash(state_secret_sword_stash), 
        .v(v)  
    );
	 
    // D-Flip Flops for each room state
    d_ff cave_ff (
        .d(state_cave_of_cacophony_next),
        .clk(clk),
        .q(state_cave_of_cacophony)
    );

    d_ff twisty_ff (
        .d(state_twisty_tunnel_next),
        .clk(clk),
        .q(state_twisty_tunnel)
    );

    d_ff rapid_ff (
        .d(state_rapid_river_next),
        .clk(clk),
        .q(state_rapid_river)
    );

    d_ff sword_ff (
        .d(state_secret_sword_stash_next),
        .clk(clk),
        .q(state_secret_sword_stash)
    );

    d_ff dragon_ff (
        .d(state_dragon_den_next),
        .clk(clk),
        .q(state_dragon_den)
    );

    d_ff victory_ff (
        .d(state_victory_vault_next),
        .clk(clk),
        .q(state_victory_vault)
    );

    d_ff graveyard_ff (
        .d(state_grievous_graveyard_next),
        .clk(clk),
        .q(state_grievous_graveyard)
    );

    always_comb begin
        state_cave_of_cacophony_next = state_cave_of_cacophony;
        state_twisty_tunnel_next = state_twisty_tunnel;
        state_rapid_river_next = state_rapid_river;
        state_secret_sword_stash_next = state_secret_sword_stash;
        state_dragon_den_next = state_dragon_den;
        state_victory_vault_next = state_victory_vault;
        state_grievous_graveyard_next = state_grievous_graveyard;

        // Reset logic
        if (reset) begin
            state_cave_of_cacophony_next = 1'b1;
            state_twisty_tunnel_next = 1'b0;
            state_rapid_river_next = 1'b0;
            state_secret_sword_stash_next = 1'b0;
            state_dragon_den_next = 1'b0;
            state_victory_vault_next = 1'b0;
            state_grievous_graveyard_next = 1'b0;
        end else begin
            
            // Cave of Cacophony -> Twisty Tunnel (East)
            if (state_cave_of_cacophony && e) begin
                state_cave_of_cacophony_next = 1'b0;
                state_twisty_tunnel_next = 1'b1;
            end
            // Twisty Tunnel -> Rapid River (South)
            else if (state_twisty_tunnel && s) begin
                state_twisty_tunnel_next = 1'b0;
                state_rapid_river_next = 1'b1;
            end
            // Rapid River -> Secret Sword Stash (West)
            else if (state_rapid_river && w) begin
                state_rapid_river_next = 1'b0;
                state_secret_sword_stash_next = 1'b1;
            end
            // Secret Sword Stash -> Rapid River (east)
            else if (state_secret_sword_stash && e) begin
                state_secret_sword_stash_next = 1'b0;
                state_rapid_river_next = 1'b1;
            end
            // Rapid River -> Dragon's Den (South-East)
            else if (state_rapid_river && s && e) begin
                state_rapid_river_next = 1'b0;
                state_dragon_den_next = 1'b1;
            end
            // Dragon Den -> Victory Vault (With Vorpal Sword)
            else if (state_dragon_den && v) begin
                state_dragon_den_next = 1'b0;
                state_victory_vault_next = 1'b1;
            end
            // Dragon Den -> Grievous Graveyard (Without Vorpal Sword)
            else if (state_dragon_den && !v) begin
                state_dragon_den_next = 1'b0;
                state_grievous_graveyard_next = 1'b1;
            end
        end
    end

    // Output logic
    assign sw = state_secret_sword_stash;  
    assign win = state_victory_vault;      
    assign d = state_grievous_graveyard;
	 
    assign s0 = state_cave_of_cacophony;
    assign s1 = state_twisty_tunnel;
    assign s2 = state_rapid_river;
    assign s3 = state_secret_sword_stash;
    assign s4 = state_dragon_den;
    assign s5 = state_victory_vault;
    assign s6 = state_grievous_graveyard;

endmodule


