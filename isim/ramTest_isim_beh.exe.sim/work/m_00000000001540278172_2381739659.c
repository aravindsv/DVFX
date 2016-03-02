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
static const char *ng0 = "C:/Users/152/Desktop/DanielAravind/Lab4/memory.v";
static int ng1[] = {5, 0};
static int ng2[] = {1, 0};
static int ng3[] = {0, 0};



static void Always_34_0(char *t0)
{
    char t7[8];
    char t18[8];
    char t19[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 3896);
    *((int *)t2) = 1;
    t3 = (t0 + 3360);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(35, ng0);

LAB5:    xsi_set_current_line(36, ng0);
    t4 = (t0 + 2248);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t0 + 2248);
    t9 = (t8 + 72U);
    t10 = *((char **)t9);
    t11 = (t0 + 2248);
    t12 = (t11 + 64U);
    t13 = *((char **)t12);
    t14 = (t0 + 2408);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    xsi_vlog_generic_get_array_select_value(t7, 16, t6, t10, t13, 2, 1, t16, 32, 1);
    t17 = (t0 + 1928);
    xsi_vlogvar_assign_value(t17, t7, 0, 0, 16);
    xsi_set_current_line(38, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2248);
    t6 = (t5 + 72U);
    t8 = *((char **)t6);
    t9 = (t0 + 2248);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = (t0 + 2408);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t0 + 1528U);
    t16 = *((char **)t15);
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 32, t14, 32, t16, 12);
    t15 = ((char*)((ng1)));
    memset(t19, 0, 8);
    xsi_vlog_unsigned_mod(t19, 32, t18, 32, t15, 32);
    xsi_vlog_generic_get_array_select_value(t7, 16, t4, t8, t11, 2, 1, t19, 32, 2);
    t17 = (t0 + 2088);
    xsi_vlogvar_assign_value(t17, t7, 0, 0, 16);
    goto LAB2;

}

static void Always_41_1(char *t0)
{
    char t6[8];
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    int t19;
    char *t20;
    unsigned int t21;
    int t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    int t26;
    int t27;
    unsigned int t28;

LAB0:    t1 = (t0 + 3576U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 3912);
    *((int *)t2) = 1;
    t3 = (t0 + 3608);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(42, ng0);

LAB5:    xsi_set_current_line(43, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 2248);
    t8 = (t0 + 2248);
    t9 = (t8 + 72U);
    t10 = *((char **)t9);
    t11 = (t0 + 2248);
    t12 = (t11 + 64U);
    t13 = *((char **)t12);
    t14 = (t0 + 2408);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    xsi_vlog_generic_convert_array_indices(t6, t7, t10, t13, 2, 1, t16, 32, 1);
    t17 = (t6 + 4);
    t18 = *((unsigned int *)t17);
    t19 = (!(t18));
    t20 = (t7 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (!(t21));
    t23 = (t19 && t22);
    if (t23 == 1)
        goto LAB6;

LAB7:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t8 = ((char*)((ng1)));
    memset(t7, 0, 8);
    xsi_vlog_signed_equal(t7, 32, t6, 32, t8, 32);
    t9 = (t7 + 4);
    t18 = *((unsigned int *)t9);
    t21 = (~(t18));
    t24 = *((unsigned int *)t7);
    t25 = (t24 & t21);
    t28 = (t25 != 0);
    if (t28 > 0)
        goto LAB8;

LAB9:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t8 = (t0 + 2408);
    xsi_vlogvar_assign_value(t8, t6, 0, 0, 32);

LAB10:    goto LAB2;

LAB6:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t7);
    t26 = (t24 - t25);
    t27 = (t26 + 1);
    xsi_vlogvar_assign_value(t4, t5, 0, *((unsigned int *)t7), t27);
    goto LAB7;

LAB8:    xsi_set_current_line(45, ng0);
    t10 = ((char*)((ng3)));
    t11 = (t0 + 2408);
    xsi_vlogvar_assign_value(t11, t10, 0, 0, 32);
    goto LAB10;

}


extern void work_m_00000000001540278172_2381739659_init()
{
	static char *pe[] = {(void *)Always_34_0,(void *)Always_41_1};
	xsi_register_didat("work_m_00000000001540278172_2381739659", "isim/ramTest_isim_beh.exe.sim/work/m_00000000001540278172_2381739659.didat");
	xsi_register_executes(pe);
}
