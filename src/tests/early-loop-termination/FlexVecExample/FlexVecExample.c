int benchmark() {

    //Declerations
    int pos=0;
    int max_pos=64;
    int cand;
    int mcost;
    int min_mcost = 0;
    int best_pos;
    int spiral_srch[64];
    int mv[64];

    //Setup
    for (int spiral_index=0; spiral_index<64; spiral_index++){
        spiral_srch[spiral_index] = spiral_index;
    }

    for (int mv_index=0; mv_index<64; mv_index++){
        mv[mv_index] = mv_index;
    }

    mv[32] = -1;

    //Loop under test
    for( ; pos < max_pos; pos++){
        cand = spiral_srch[pos];
        mcost = mv[cand];
        if (mcost < min_mcost){
            best_pos = pos; //live-out
            break;
        }
    }

    return best_pos;
}