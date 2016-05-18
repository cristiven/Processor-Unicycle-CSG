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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *STD_TEXTIO;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    std_textio_init();
    work_a_2580317397_4211845483_init();
    work_a_1074805832_1084075168_init();
    work_a_1991350011_3640945453_init();
    work_a_1707665227_2780622642_init();
    work_a_0953353097_2606300448_init();
    work_a_2425904575_2759040872_init();
    work_a_0832606739_1499595665_init();
    work_a_0992986323_2533543878_init();
    work_a_0290344353_3049860944_init();
    work_a_2521819606_2119551917_init();
    work_a_3961274036_0397955563_init();
    work_a_0295498852_3999931507_init();
    work_a_2419485947_0269652351_init();
    work_a_1911513918_3946495248_init();
    work_a_3641314380_1618006351_init();
    work_a_2540214590_0573327170_init();
    work_a_3781366023_2065622664_init();
    work_a_0542593727_2349577957_init();
    work_a_2281642043_4245071457_init();
    work_a_1187732355_0169080332_init();
    work_a_1512746733_3835544385_init();


    xsi_register_tops("work_a_1512746733_3835544385");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");

    return xsi_run_simulation(argc, argv);

}
