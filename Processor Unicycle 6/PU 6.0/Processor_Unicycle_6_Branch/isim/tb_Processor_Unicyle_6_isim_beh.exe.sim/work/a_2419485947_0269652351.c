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
static const char *ng0 = "C:/Users/Cristian/Google Drive/CS se/Practice/Computer Architecture/PU 6.0/Modules 6.0/DM.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_2419485947_0269652351_p_0(char *t0)
{
    char t15[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    int t16;
    unsigned int t17;
    int t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 1352U);
    t5 = *((char **)t1);
    t11 = (31 - 5);
    t13 = (t11 * 1U);
    t14 = (0 + t13);
    t1 = (t5 + t14);
    t6 = (t15 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 5;
    t7 = (t6 + 4U);
    *((int *)t7) = 0;
    t7 = (t6 + 8U);
    *((int *)t7) = -1;
    t16 = (0 - 5);
    t17 = (t16 * -1);
    t17 = (t17 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t17;
    t18 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t1, t15);
    t19 = (t18 - 0);
    t17 = (t19 * 1);
    t20 = (32U * t17);
    t21 = (0U + t20);
    t7 = (t0 + 3456);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    memcpy(t12, t2, 32U);
    xsi_driver_first_trans_delta(t7, t21, 32U, 0LL);

LAB8:
LAB3:    t1 = (t0 + 3312);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(45, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t5 = t1;
    memset(t5, (unsigned char)2, 32U);
    t6 = (t0 + 3392);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(46, ng0);
    t1 = xsi_get_transient_memory(2048U);
    memset(t1, 0, 2048U);
    t2 = t1;
    t5 = (t0 + 8250);
    t3 = (32U != 0);
    if (t3 == 1)
        goto LAB5;

LAB6:    t7 = (t0 + 3456);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    memcpy(t12, t1, 2048U);
    xsi_driver_first_trans_fast(t7);
    goto LAB3;

LAB5:    t11 = (2048U / 32U);
    xsi_mem_set_data(t2, t5, 32U, t11);
    goto LAB6;

LAB7:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1832U);
    t5 = *((char **)t1);
    t1 = (t0 + 1352U);
    t6 = *((char **)t1);
    t11 = (31 - 5);
    t13 = (t11 * 1U);
    t14 = (0 + t13);
    t1 = (t6 + t14);
    t7 = (t15 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 5;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t16 = (0 - 5);
    t17 = (t16 * -1);
    t17 = (t17 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t17;
    t18 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t1, t15);
    t19 = (t18 - 0);
    t17 = (t19 * 1);
    xsi_vhdl_check_range_of_index(0, 63, 1, t18);
    t20 = (32U * t17);
    t21 = (0 + t20);
    t8 = (t5 + t21);
    t9 = (t0 + 3392);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    t22 = (t12 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t8, 32U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB8;

}


extern void work_a_2419485947_0269652351_init()
{
	static char *pe[] = {(void *)work_a_2419485947_0269652351_p_0};
	xsi_register_didat("work_a_2419485947_0269652351", "isim/tb_Processor_Unicyle_6_isim_beh.exe.sim/work/a_2419485947_0269652351.didat");
	xsi_register_executes(pe);
}
