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
extern void execute_141(char*, char *);
extern void execute_142(char*, char *);
extern void execute_423(char*, char *);
extern void execute_147(char*, char *);
extern void execute_148(char*, char *);
extern void execute_149(char*, char *);
extern void execute_150(char*, char *);
extern void execute_151(char*, char *);
extern void execute_152(char*, char *);
extern void execute_153(char*, char *);
extern void execute_154(char*, char *);
extern void execute_155(char*, char *);
extern void execute_408(char*, char *);
extern void execute_409(char*, char *);
extern void execute_410(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_413(char*, char *);
extern void execute_414(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_417(char*, char *);
extern void execute_418(char*, char *);
extern void execute_419(char*, char *);
extern void execute_421(char*, char *);
extern void execute_422(char*, char *);
extern void execute_276(char*, char *);
extern void execute_277(char*, char *);
extern void execute_278(char*, char *);
extern void execute_279(char*, char *);
extern void execute_280(char*, char *);
extern void execute_281(char*, char *);
extern void execute_156(char*, char *);
extern void execute_157(char*, char *);
extern void execute_158(char*, char *);
extern void execute_159(char*, char *);
extern void execute_160(char*, char *);
extern void execute_161(char*, char *);
extern void execute_162(char*, char *);
extern void execute_163(char*, char *);
extern void execute_176(char*, char *);
extern void execute_177(char*, char *);
extern void execute_178(char*, char *);
extern void execute_179(char*, char *);
extern void execute_180(char*, char *);
extern void execute_181(char*, char *);
extern void execute_182(char*, char *);
extern void execute_183(char*, char *);
extern void execute_184(char*, char *);
extern void execute_185(char*, char *);
extern void execute_6(char*, char *);
extern void execute_7(char*, char *);
extern void execute_8(char*, char *);
extern void execute_164(char*, char *);
extern void execute_165(char*, char *);
extern void execute_166(char*, char *);
extern void execute_144(char*, char *);
extern void execute_145(char*, char *);
extern void execute_146(char*, char *);
extern void execute_424(char*, char *);
extern void execute_425(char*, char *);
extern void execute_426(char*, char *);
extern void execute_427(char*, char *);
extern void execute_428(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_15(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_16(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_20(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_25(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_121(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_122(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_240(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_241(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_53(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_57(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_61(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_65(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_80(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_84(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_88(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_92(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_107(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_111(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_115(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_119(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_136(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_140(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_144(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_148(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_172(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_176(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_180(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_184(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_199(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_203(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_207(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_211(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_226(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_230(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_234(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_238(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_255(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_259(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_263(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_267(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[103] = {(funcp)execute_141, (funcp)execute_142, (funcp)execute_423, (funcp)execute_147, (funcp)execute_148, (funcp)execute_149, (funcp)execute_150, (funcp)execute_151, (funcp)execute_152, (funcp)execute_153, (funcp)execute_154, (funcp)execute_155, (funcp)execute_408, (funcp)execute_409, (funcp)execute_410, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_413, (funcp)execute_414, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_417, (funcp)execute_418, (funcp)execute_419, (funcp)execute_421, (funcp)execute_422, (funcp)execute_276, (funcp)execute_277, (funcp)execute_278, (funcp)execute_279, (funcp)execute_280, (funcp)execute_281, (funcp)execute_156, (funcp)execute_157, (funcp)execute_158, (funcp)execute_159, (funcp)execute_160, (funcp)execute_161, (funcp)execute_162, (funcp)execute_163, (funcp)execute_176, (funcp)execute_177, (funcp)execute_178, (funcp)execute_179, (funcp)execute_180, (funcp)execute_181, (funcp)execute_182, (funcp)execute_183, (funcp)execute_184, (funcp)execute_185, (funcp)execute_6, (funcp)execute_7, (funcp)execute_8, (funcp)execute_164, (funcp)execute_165, (funcp)execute_166, (funcp)execute_144, (funcp)execute_145, (funcp)execute_146, (funcp)execute_424, (funcp)execute_425, (funcp)execute_426, (funcp)execute_427, (funcp)execute_428, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_15, (funcp)transaction_16, (funcp)transaction_20, (funcp)transaction_25, (funcp)transaction_121, (funcp)transaction_122, (funcp)transaction_240, (funcp)transaction_241, (funcp)transaction_53, (funcp)transaction_57, (funcp)transaction_61, (funcp)transaction_65, (funcp)transaction_80, (funcp)transaction_84, (funcp)transaction_88, (funcp)transaction_92, (funcp)transaction_107, (funcp)transaction_111, (funcp)transaction_115, (funcp)transaction_119, (funcp)transaction_136, (funcp)transaction_140, (funcp)transaction_144, (funcp)transaction_148, (funcp)transaction_172, (funcp)transaction_176, (funcp)transaction_180, (funcp)transaction_184, (funcp)transaction_199, (funcp)transaction_203, (funcp)transaction_207, (funcp)transaction_211, (funcp)transaction_226, (funcp)transaction_230, (funcp)transaction_234, (funcp)transaction_238, (funcp)transaction_255, (funcp)transaction_259, (funcp)transaction_263, (funcp)transaction_267};
const int NumRelocateId= 103;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/lab7_VGAtestbench_behav/xsim.reloc",  (void **)funcTab, 103);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/lab7_VGAtestbench_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/lab7_VGAtestbench_behav/xsim.reloc");
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
    iki_set_sv_type_file_path_name("xsim.dir/lab7_VGAtestbench_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/lab7_VGAtestbench_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/lab7_VGAtestbench_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
