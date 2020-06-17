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
extern char *STD_TEXTIO;
extern char *STD_STANDARD;
extern char *IEEE_P_3620187407;

char *ieee_p_3499444699_sub_2213602152_3536714472(char *, char *, int , int );
int ieee_p_3499444699_sub_252593879_3536714472(char *, int );
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_1130845995_0831356973_p_0(char *t0)
{
    char t25[16];
    char t26[16];
    char t28[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned char t16;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;
    unsigned char t20;
    unsigned char t21;
    int t22;
    int t23;
    int t24;
    char *t27;
    char *t29;
    char *t30;
    unsigned int t31;

LAB0:    t1 = (t0 + 3008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(540, ng0);
    t2 = (t0 + 8600);
    *((int *)t2) = 0;
    t3 = (t0 + 8604);
    *((int *)t3) = 63;
    t4 = 0;
    t5 = 63;

LAB4:    if (t4 <= t5)
        goto LAB5;

LAB7:    xsi_set_current_line(543, ng0);
    t2 = (t0 + 1608U);
    t3 = *((char **)t2);
    t2 = (t3 + 0);
    *((int *)t2) = 0;
    xsi_set_current_line(544, ng0);

LAB9:    t2 = (t0 + 2176U);
    t16 = std_textio_endfile(t2);
    t17 = (!(t16));
    if (t17 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(567, ng0);

LAB29:
LAB30:    xsi_set_current_line(569, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t0 + 1032U);
    t6 = *((char **)t2);
    t2 = (t0 + 6340U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t6, t2);
    t5 = (t4 - 63);
    t12 = (t5 * -1);
    xsi_vhdl_check_range_of_index(63, 0, -1, t4);
    t13 = (32U * t12);
    t14 = (0 + t13);
    t7 = (t3 + t14);
    t8 = (t0 + 3408);
    t9 = (t8 + 56U);
    t15 = *((char **)t9);
    t27 = (t15 + 56U);
    t29 = *((char **)t27);
    memcpy(t29, t7, 32U);
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(570, ng0);

LAB35:    t2 = (t0 + 3328);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB36;

LAB1:    return;
LAB5:    xsi_set_current_line(541, ng0);
    t6 = (t0 + 8608);
    t8 = (t0 + 1848U);
    t9 = *((char **)t8);
    t8 = (t0 + 8600);
    t10 = ieee_p_3499444699_sub_252593879_3536714472(IEEE_P_3499444699, *((int *)t8));
    t11 = (t10 - 63);
    t12 = (t11 * -1);
    xsi_vhdl_check_range_of_index(63, 0, -1, t10);
    t13 = (32U * t12);
    t14 = (0 + t13);
    t15 = (t9 + t14);
    memcpy(t15, t6, 32U);

LAB6:    t2 = (t0 + 8600);
    t4 = *((int *)t2);
    t3 = (t0 + 8604);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB7;

LAB8:    t10 = (t4 + 1);
    t4 = t10;
    t6 = (t0 + 8600);
    *((int *)t6) = t4;
    goto LAB4;

LAB10:    xsi_set_current_line(545, ng0);
    t3 = (t0 + 2816);
    t6 = (t0 + 2176U);
    t7 = (t0 + 2352U);
    std_textio_readline(STD_TEXTIO, t3, t6, t7);
    xsi_set_current_line(547, ng0);
    t2 = (t0 + 1728U);
    t3 = *((char **)t2);
    t2 = (t3 + 0);
    *((int *)t2) = 0;
    xsi_set_current_line(548, ng0);
    t2 = (t0 + 8640);
    *((int *)t2) = 1;
    t3 = (t0 + 8644);
    *((int *)t3) = 8;
    t4 = 1;
    t5 = 8;

LAB13:    if (t4 <= t5)
        goto LAB14;

LAB16:    xsi_set_current_line(563, ng0);
    t2 = (t0 + 1728U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = ieee_p_3499444699_sub_2213602152_3536714472(IEEE_P_3499444699, t25, t4, 32);
    t6 = (t0 + 1848U);
    t7 = *((char **)t6);
    t6 = (t0 + 1608U);
    t8 = *((char **)t6);
    t5 = *((int *)t8);
    t10 = (t5 - 63);
    t12 = (t10 * -1);
    xsi_vhdl_check_range_of_index(63, 0, -1, t5);
    t13 = (32U * t12);
    t14 = (0 + t13);
    t6 = (t7 + t14);
    t9 = (t25 + 12U);
    t31 = *((unsigned int *)t9);
    t31 = (t31 * 1U);
    memcpy(t6, t2, t31);
    xsi_set_current_line(564, ng0);
    t2 = (t0 + 1608U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t5 = (t4 + 1);
    t2 = (t0 + 1608U);
    t6 = *((char **)t2);
    t2 = (t6 + 0);
    *((int *)t2) = t5;
    goto LAB9;

LAB11:;
LAB14:    xsi_set_current_line(549, ng0);
    t6 = (t0 + 2816);
    t7 = (t0 + 2352U);
    t8 = (t0 + 1488U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    std_textio_read8(STD_TEXTIO, t6, t7, t8);
    xsi_set_current_line(550, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t17 = *((unsigned char *)t3);
    t18 = ((unsigned char)48 <= t17);
    if (t18 == 1)
        goto LAB20;

LAB21:    t16 = (unsigned char)0;

LAB22:    if (t16 != 0)
        goto LAB17;

LAB19:    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t17 = *((unsigned char *)t3);
    t18 = ((unsigned char)97 <= t17);
    if (t18 == 1)
        goto LAB25;

LAB26:    t16 = (unsigned char)0;

LAB27:    if (t16 != 0)
        goto LAB23;

LAB24:    xsi_set_current_line(556, ng0);
    t2 = (t0 + 8648);
    t6 = ((STD_STANDARD) + 384);
    t7 = (t0 + 1608U);
    t8 = *((char **)t7);
    t10 = *((int *)t8);
    t7 = xsi_int_to_mem(t10);
    t9 = xsi_string_variable_get_image(t25, t6, t7);
    t27 = ((STD_STANDARD) + 1008);
    t29 = (t28 + 0U);
    t30 = (t29 + 0U);
    *((int *)t30) = 1;
    t30 = (t29 + 4U);
    *((int *)t30) = 21;
    t30 = (t29 + 8U);
    *((int *)t30) = 1;
    t11 = (21 - 1);
    t12 = (t11 * 1);
    t12 = (t12 + 1);
    t30 = (t29 + 12U);
    *((unsigned int *)t30) = t12;
    t15 = xsi_base_array_concat(t15, t26, t27, (char)97, t2, t28, (char)97, t9, t25, (char)101);
    t30 = (t25 + 12U);
    t12 = *((unsigned int *)t30);
    t13 = (21U + t12);
    xsi_report(t15, t13, (unsigned char)2);

LAB18:
LAB15:    t2 = (t0 + 8640);
    t4 = *((int *)t2);
    t3 = (t0 + 8644);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB16;

LAB28:    t10 = (t4 + 1);
    t4 = t10;
    t6 = (t0 + 8640);
    *((int *)t6) = t4;
    goto LAB13;

LAB17:    xsi_set_current_line(551, ng0);
    t2 = (t0 + 1728U);
    t7 = *((char **)t2);
    t10 = *((int *)t7);
    t11 = (t10 * 16);
    t2 = (t0 + 1488U);
    t8 = *((char **)t2);
    t21 = *((unsigned char *)t8);
    t22 = (t11 + (((int)(t21))));
    t23 = (t22 - (((int)((unsigned char)48))));
    t2 = (t0 + 1728U);
    t9 = *((char **)t2);
    t2 = (t9 + 0);
    *((int *)t2) = t23;
    goto LAB18;

LAB20:    t2 = (t0 + 1488U);
    t6 = *((char **)t2);
    t19 = *((unsigned char *)t6);
    t20 = (t19 <= (unsigned char)57);
    t16 = t20;
    goto LAB22;

LAB23:    xsi_set_current_line(554, ng0);
    t2 = (t0 + 1728U);
    t7 = *((char **)t2);
    t10 = *((int *)t7);
    t11 = (t10 * 16);
    t2 = (t0 + 1488U);
    t8 = *((char **)t2);
    t21 = *((unsigned char *)t8);
    t22 = (t11 + (((int)(t21))));
    t23 = (t22 - (((int)((unsigned char)97))));
    t24 = (t23 + 10);
    t2 = (t0 + 1728U);
    t9 = *((char **)t2);
    t2 = (t9 + 0);
    *((int *)t2) = t24;
    goto LAB18;

LAB25:    t2 = (t0 + 1488U);
    t6 = *((char **)t2);
    t19 = *((unsigned char *)t6);
    t20 = (t19 <= (unsigned char)102);
    t16 = t20;
    goto LAB27;

LAB31:;
LAB32:    goto LAB2;

LAB33:    t3 = (t0 + 3328);
    *((int *)t3) = 0;
    goto LAB29;

LAB34:    goto LAB33;

LAB36:    goto LAB34;

}


extern void work_a_1130845995_0831356973_init()
{
	static char *pe[] = {(void *)work_a_1130845995_0831356973_p_0};
	xsi_register_didat("work_a_1130845995_0831356973", "isim/top_tb_isim_beh.exe.sim/work/a_1130845995_0831356973.didat");
	xsi_register_executes(pe);
}
