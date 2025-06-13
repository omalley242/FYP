int main() {

    //Declerations
    int pos=0;
    int max_pos=1000;
    int cand;
    int mcost;
    int mcost_2;
    int min_mcost = 0;
    int min_mcost_2 = 4;
    int best_pos = 0;
    int spiral_srch[64];
    int mv[64];
    int temp = 0;


    //Setup
    for (int spiral_index=0; spiral_index<1000; spiral_index++){
        spiral_srch[spiral_index] = spiral_index;
    }

    for (int mv_index=0; mv_index<1000; mv_index++){
        mv[mv_index] = mv_index;
    }

    mv[36] = -1;

    // Pragma to force vectorization (when cost model says not worth)
    #pragma clang loop vectorize_width(4, scalable) interleave_count(4)
    for( ; pos < max_pos; pos++){
        cand = spiral_srch[pos];
        mcost = mv[cand];

        // Early Exit 1
        if (mcost < min_mcost){
            best_pos = pos; //live-out
            break;
        }

        // // Early Exit 2
        // if (mcost < min_mcost_2){
        //     best_pos = temp; //live-out
        //     break;
        // }
        
        temp += 5;

    }

    return best_pos;
}