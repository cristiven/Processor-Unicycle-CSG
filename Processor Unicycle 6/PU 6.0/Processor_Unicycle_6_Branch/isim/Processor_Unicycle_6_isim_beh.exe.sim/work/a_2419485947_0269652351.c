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
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1258338084_503743352(char *, char *, unsigned int , unsigned int );
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_2419485947_0269652351_p_0(char *t0)
{
    char t16[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    int t17;
    unsigned int t18;
    int t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1152U);
    t2 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3472);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(44, ng0);
    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 1512U);
    t4 = *((char **)t1);
    t13 = (31 - 5);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t4 + t15);
    t7 = (t16 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 5;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t17 = (0 - 5);
    t18 = (t17 * -1);
    t18 = (t18 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t18;
    t19 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t1, t16);
    t20 = (t19 - 0);
    t18 = (t20 * 1);
    t21 = (32U * t18);
    t22 = (0U + t21);
    t8 = (t0 + 3616);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 32U);
    xsi_driver_first_trans_delta(t8, t22, 32U, 0LL);

LAB11:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(45, ng0);
    t3 = xsi_get_transient_memory(32U);
    memset(t3, 0, 32U);
    t7 = t3;
    memset(t7, (unsigned char)2, 32U);
    t8 = (t0 + 3552);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 32U);
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(46, ng0);
    t1 = xsi_get_transient_memory(2048U);
    memset(t1, 0, 2048U);
    t3 = t1;
    t4 = (t0 + 8515);
    t2 = (32U != 0);
    if (t2 == 1)
        goto LAB8;

LAB9:    t8 = (t0 + 3616);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 2048U);
    xsi_driver_first_trans_fast(t8);
    goto LAB6;

LAB8:    t13 = (2048U / 32U);
    xsi_mem_set_data(t3, t4, 32U, t13);
    goto LAB9;

LAB10:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1992U);
    t4 = *((char **)t1);
    t1 = (t0 + 1512U);
    t7 = *((char **)t1);
    t13 = (31 - 5);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t7 + t15);
    t8 = (t16 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 5;
    t9 = (t8 + 4U);
    *((int *)t9) = 0;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t17 = (0 - 5);
    t18 = (t17 * -1);
    t18 = (t18 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t18;
    t19 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t1, t16);
    t20 = (t19 - 0);
    t18 = (t20 * 1);
    xsi_vhdl_check_range_of_index(0, 63, 1, t19);
    t21 = (32U * t18);
    t22 = (0 + t21);
    t9 = (t4 + t22);
    t10 = (t0 + 3552);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t23 = (t12 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t9, 32U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB11;

}


extern void work_a_2419485947_0269652351_init()
{
	static char *pe[] = {(void *)work_a_2419485947_0269652351_p_0};
	xsi_register_didat("work_a_2419485947_0269652351", "isim/Processor_Unicycle_6_isim_beh.exe.sim/work/a_2419485947_0269652351.didat");
	xsi_register_executes(pe);
}
