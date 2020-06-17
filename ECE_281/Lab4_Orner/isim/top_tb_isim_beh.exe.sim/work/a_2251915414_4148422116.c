/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring_2016/ECE_281/Labs_and_CEs/Lab4_Orner/mips_combo.vhd";
extern char *IEEE_P_3499444699;

char *ieee_p_3499444699_sub_2213602152_3536714472(char *, char *, int , int );


static void work_a_2251915414_4148422116_p_0(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned char t12;
    char *t13;

LAB0:    xsi_set_current_line(457, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB9;

LAB10:    t3 = (unsigned char)0;

LAB11:    if (t3 != 0)
        goto LAB7;

LAB8:
LAB3:    t1 = (t0 + 3112);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(457, ng0);
    t1 = ieee_p_3499444699_sub_2213602152_3536714472(IEEE_P_3499444699, t5, 0, 32);
    t6 = (32U != 32U);
    if (t6 == 1)
        goto LAB5;

LAB6:    t7 = (t0 + 3192);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 32U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB3;

LAB5:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB6;

LAB7:    xsi_set_current_line(459, ng0);
    t2 = (t0 + 1352U);
    t8 = *((char **)t2);
    t2 = (t0 + 3192);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t8, 32U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB3;

LAB9:    t2 = (t0 + 1032U);
    t7 = *((char **)t2);
    t6 = *((unsigned char *)t7);
    t12 = (t6 == (unsigned char)3);
    t3 = t12;
    goto LAB11;

}


extern void work_a_2251915414_4148422116_init()
{
	static char *pe[] = {(void *)work_a_2251915414_4148422116_p_0};
	xsi_register_didat("work_a_2251915414_4148422116", "isim/top_tb_isim_beh.exe.sim/work/a_2251915414_4148422116.didat");
	xsi_register_executes(pe);
}
