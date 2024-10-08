module game (
    input logic clk,n,s,e,w,reset, 

    output logic s6,win,s5,d,s4,s3,sw,s2,s1,s0,v 
    );

    // Instantiate the Room FSM
    Room room (
        .clk(clk),
        .n(n),
        .s(s),
        .e(e),
        .w(w),
        .reset(reset),
        .s6(s6),
        .win(win),
        .s5(s5),
        .d(d),
        .s4(s4),
        .s3(s3),
        .sw(sw),
        .s2(s2),
        .s1(s1),
        .s0(s0)
    );

    // Instantiate the Sword FSM
    sword sword (
        .clk(clk),
        .reset(reset),
        .in_secret_sword_stash(s3),  
        .v(v)
    );

endmodule

//module tb_game_win();
    //logic clk, n, s, e, w, reset;
    //logic s6, win, s5, d, s4, s3, sw, s2, s1, s0, v;

    //game uut (
        //.clk(clk),
        //.n(n),
        //.s(s),
        //.e(e),
        //.w(w),
        //.reset(reset),
        //.s6(s6),
        //.win(win),
        //.s5(s5),
        //.d(d),
        //.s4(s4),
        //.s3(s3),
        //.sw(sw),
        //.s2(s2),
        //.s1(s1),
        //.s0(s0),
        //.v(v)
    //);

    
    //always #5 clk = ~clk;

    // Test scenario for winning the game
        //clk = 0; n = 0; s = 0; e = 0; w = 0; reset = 1;

        //#10 reset = 0;

        // Step 1: Move East from Cave of Cacophony (s0) to Twisty Tunnel (s1)
        //#10 e = 1;
        //#10 e = 0;
        

        // Step 2: Move South from Twisty Tunnel (s1) to Rapid River (s2)
        //#10 s = 1;
        //#10 s = 0;
        

        // Step 3: Move West from Rapid River (s2) to Secret Sword Stash (s3)
        //#10 w = 1;
        //#10 w = 0;
        

        // Step 4: Move East back to Rapid River (s2)
        //#10 e = 1;
        //#10 e = 0;
        

        // Step 5: Move South-East from Rapid River (s2) to Dragon Den (s4)
        //#10 s = 1; e = 1;
        //#10 s = 0; e = 0;
        

        // Step 6: Move North with the sword (v) to Victory Vault (win)
        //#10 n = 1;
        //#10 n = 0;
        

        // Finish simulation
        //#10 $finish;
    //end

//endmodule

//module tb_game_lose();
    //logic clk, n, s, e, w, reset;
    //logic s6, win, s5, d, s4, s3, sw, s2, s1, s0, v;

    //game uut (
        //.clk(clk),
        //.n(n),
        //.s(s),
        //.e(e),
        //.w(w),
        //.reset(reset),
        //.s6(s6),
        //.win(win),
        //.s5(s5),
        //.d(d),
        //.s4(s4),
        //.s3(s3),
        //.sw(sw),
        //.s2(s2),
        //.s1(s1),
        //.s0(s0),
        //.v(v)
    //);

    //always #5 clk = ~clk;

    // Test scenario for losing the game
    //initial begin
        //clk = 0; n = 0; s = 0; e = 0; w = 0; reset = 1;

        //#10 reset = 0;

        // Step 1: Move East from Cave of Cacophony (s0) to Twisty Tunnel (s1)
        //#10 e = 1;
        //#10 e = 0;

        // Step 2: Move South from Twisty Tunnel (s1) to Rapid River (s2)
        //#10 s = 1;
        //#10 s = 0;

        // Step 3: Move South-East from Rapid River (s2) to Dragon Den (s4)
        //#10 s = 1; e = 1;
        //#10 s = 0; e = 0;
        
        // Step 4: Move North without the sword (v = 0) to Grievous Graveyard (d)
        //#10 n = 1;
        //#10 n = 0;

        //#10 $finish;
    //end

//endmodule

