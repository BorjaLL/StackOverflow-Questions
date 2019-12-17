DECLARE
    v_p         NUMBER := 0;
    v_dvalue    NUMBER := 0;
    v_v5        NUMBER := 0;
    v_rb        NUMBER := 0; --relative base
    v_go        NUMBER := 0;
    v_debugid   NUMBER := 0;
    v_item      VARCHAR2(3200);
    v_base1     VARCHAR2(3200);
    v_x         NUMBER := 0;
    v_y         NUMBER := 0;

    PROCEDURE show_hull IS
        v_base1 VARCHAR2(32000);
    BEGIN
        FOR v_count IN 0..99 LOOP
            IF v_count < 10 THEN
                SELECT
                    x1
                INTO v_base1
                FROM
                    hull
                WHERE
                    id = v_count;

                dbms_output.put_line(v_count
                                     || '  '
                                     || v_base1);
            ELSE
                SELECT
                    x1
                INTO v_base1
                FROM
                    hull
                WHERE
                    id = v_count;

                dbms_output.put_line(v_count
                                     || ' '
                                     || v_base1);
            END IF;
        END LOOP;
    END;

BEGIN
    DELETE FROM t_debug;

    DELETE FROM csv
    WHERE
        oldvalue IS NULL;

    UPDATE csv
    SET
        value0 = oldvalue;

    COMMIT;
    while v_dvalue !=99 LOOP
        intcode0(v_p, v_v5, v_dvalue, v_rb, v_go, v_debugid);
        
        IF v_v5 = 35 THEN
            v_item := '#';
        ELSIF v_v5 = 46 THEN
            v_item := '.';
        ELSIF v_v5 = 10 THEN
            v_item := '/n';
            v_y := v_y + 1;
            v_x := 0;
        END IF;

        /*SELECT
            x1
        INTO v_base1
        FROM
            hull
        WHERE
            id = v_y;

        IF v_v5 != 10 THEN
            UPDATE hull
            SET
                x1 = ( replacepos(v_base1, v_item, v_x) )
            WHERE
                id = v_y;

            COMMIT;
            v_x := v_x + 1;
        END IF;--*/

        dbms_output.put_line('config '
                             || v_p
                             || ' output '
                             || v_item
                             || ' value '
                             || v_dvalue);

    END LOOP;--*/
    
    --dbms_output.put_line('config '||V_p||' output '||V_v5||' value '||V_dvalue);       

--    UPDATE csv
--    SET
--        value0 = oldvalue;
--    show_hull;

    COMMIT;
END;