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
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_2545490612_503743352(char *, unsigned char , unsigned char );


static void work_a_1208337864_3708392848_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    unsigned char t17;
    char *t18;
    unsigned char t19;
    unsigned char t20;
    unsigned char t21;
    char *t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned char t27;
    unsigned char t28;
    unsigned char t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;

LAB0:    xsi_set_current_line(242, ng0);

LAB3:    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 1352U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t3, t5);
    t1 = (t0 + 1032U);
    t7 = *((char **)t1);
    t8 = (0 - 5);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t1 = (t7 + t11);
    t12 = *((unsigned char *)t1);
    t13 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t12);
    t14 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t6, t13);
    t15 = (t0 + 2952U);
    t16 = *((char **)t15);
    t17 = *((unsigned char *)t16);
    t15 = (t0 + 1352U);
    t18 = *((char **)t15);
    t19 = *((unsigned char *)t18);
    t20 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t19);
    t21 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t17, t20);
    t15 = (t0 + 1032U);
    t22 = *((char **)t15);
    t23 = (0 - 5);
    t24 = (t23 * -1);
    t25 = (1U * t24);
    t26 = (0 + t25);
    t15 = (t22 + t26);
    t27 = *((unsigned char *)t15);
    t28 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t21, t27);
    t29 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t14, t28);
    t30 = (t0 + 4512);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    *((unsigned char *)t34) = t29;
    xsi_driver_first_trans_fast_port(t30);

LAB2:    t35 = (t0 + 4432);
    *((int *)t35) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1208337864_3708392848_init()
{
	static char *pe[] = {(void *)work_a_1208337864_3708392848_p_0};
	xsi_register_didat("work_a_1208337864_3708392848", "isim/top_tb_isim_beh.exe.sim/work/a_1208337864_3708392848.didat");
	xsi_register_executes(pe);
}
