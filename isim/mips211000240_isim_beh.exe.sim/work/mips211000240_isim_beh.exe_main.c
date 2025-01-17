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
char *IEEE_P_1242562249;
char *IEEE_P_3499444699;
char *STD_STANDARD;
char *IEEE_P_3620187407;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_3609969996_3212880686_init();
    work_a_0123541133_3212880686_init();
    work_a_3800053525_3212880686_init();
    work_a_3412061098_3212880686_init();
    work_a_1632567566_3212880686_init();
    work_a_3113615351_3212880686_init();
    work_a_1754818776_3212880686_init();
    work_a_0977712436_3212880686_init();
    work_a_4015019049_3212880686_init();
    work_a_1153420228_3212880686_init();
    work_a_0532180842_3212880686_init();
    work_a_0490290994_3212880686_init();
    work_a_4035723473_3212880686_init();


    xsi_register_tops("work_a_4035723473_3212880686");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");

    return xsi_run_simulation(argc, argv);

}
