## Code Examples From Within the Paper
- ```clike
  for (i = 0; i < hits; i++) {
    q = pairs[i].q;
    s = pairs[i].s;
    coord = q - s;
    if (s < d_arr[coord])
      	continue;
    d_arr[coord] = s;
  }
  ```
-
- ```clike
  for (v_i = v_0; ktodo = v_i < v_hits; v_i += 16) {
    //instruction not involved in any SCCs
    v_q = v_gather(k_todo, &(pairs[v_i].q), v_off);
    v_s = v_gather(k_todo, &(pairs[v_i].s), v_off);
    v_coord = v_q – v_s;//detect read after write dependencies at runtime 
    k_stop = v_conflict(k_todo , v_coord, v_coord);
    do{ //VPL starts here
      //identify unprocessed vector lanes safe to execute
      k_safe = kftm_exc(k_todo , k_stop );
      //k_safe drives instructions within the relaxed SCC
      v_temp = v_gather(k_safe , &d_arr, v_coord);
      k_1 = v_cmp_ge(k_safe , v_s, v_temp);
      v_scatter(k_1 , &d_arr, v_coord, v_s);
      //update list of unprocessed lanes
      k_todo = k_todo & ~k_safe ;
      k_stop = k_stop & k_todo ;
      
    } while(k_stop); //VPL ends here
  ```
-
-
-