/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_298(char*, char *);
extern void execute_297(char*, char *);
extern void execute_13(char*, char *);
extern void execute_17(char*, char *);
extern void execute_145(char*, char *);
extern void execute_146(char*, char *);
extern void execute_50(char*, char *);
extern void execute_51(char*, char *);
extern void execute_52(char*, char *);
extern void execute_53(char*, char *);
extern void execute_54(char*, char *);
extern void execute_149(char*, char *);
extern void execute_150(char*, char *);
extern void execute_151(char*, char *);
extern void execute_152(char*, char *);
extern void execute_154(char*, char *);
extern void execute_262(char*, char *);
extern void execute_296(char*, char *);
extern void transaction_2(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[20] = {(funcp)execute_298, (funcp)execute_297, (funcp)execute_13, (funcp)execute_17, (funcp)execute_145, (funcp)execute_146, (funcp)execute_50, (funcp)execute_51, (funcp)execute_52, (funcp)execute_53, (funcp)execute_54, (funcp)execute_149, (funcp)execute_150, (funcp)execute_151, (funcp)execute_152, (funcp)execute_154, (funcp)execute_262, (funcp)execute_296, (funcp)transaction_2, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 20;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/functional_unit_tb_behav/xsim.reloc",  (void **)funcTab, 20);
	iki_vhdl_file_variable_register(dp + 39704);
	iki_vhdl_file_variable_register(dp + 39760);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/functional_unit_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/functional_unit_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/functional_unit_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/functional_unit_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/functional_unit_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
