//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/IRPrintingPasses.h"
#include "llvm/IR/User.h"
using namespace llvm;

#define DEBUG_TYPE "hello"

STATISTIC(HelloCounter, "Counts number of functions greeted");

namespace {
  // Hello - The first implementation, without getAnalysisUsage.
  struct Hy546llvmpass : public FunctionPass {
    static char ID; // Pass identification, replacement for typeid
    Hy546llvmpass() : FunctionPass(ID) {}

bool runOnFunction(Function &F) override{
BasicBlock *bb = &F.getEntryBlock(); // 
for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
  	Instruction* ii = &*i;

  	CallInst *callInst = dyn_cast<CallInst>(ii);
          if (callInst == nullptr) {
            continue;
          }

          Function *calledFunction = callInst->getCalledFunction();

          if (calledFunction == nullptr) {
            continue;
          }

        StringRef cfName = calledFunction->getName();
	if(cfName == "printf"){
		bool h = false;
      		errs() << "Caller function name: ";
      		errs().write_escaped(F.getName()) << "\n";
		errs() << "Intruction of printf call: ";
		errs() << *ii << "\n\n";
		StringRef path = "/spare/manosanag/myllvm/llvm-project/tmp/sample.ll";
		std::vector<Value *> Args;
		std::vector<Type*> targs;
                i++;
                Instruction* next = &*i;
		GlobalVariable *G;
                for (auto &Global : F.getParent()->getGlobalList()){
                        if(!h){ G = &Global; break;}
                }
		llvm::LoadInst *li = new llvm::LoadInst(G->getOperand(0)->getType(), llvm::cast<llvm::Value>(G), "", next);
		Args.push_back(llvm::cast<llvm::Value>(li));

                for(llvm::User::value_op_iterator vi = callInst->value_op_begin(); vi != callInst->value_op_end(); ++vi){
                        vi++;
                        if(vi == callInst->value_op_end()) break;
                        vi--;
                        Args.push_back(*vi);
			targs.push_back((*vi)->getType());
                }
		SmallVector<Type*,sizeof(targs)>ArgTys;
		ArgTys.push_back(G->getOperand(0)->getType());
		ArgTys.push_back(ii->getOperand(0)->getType());

		F.getParent()->getOrInsertFunction("fprintf", FunctionType::get(F.getParent()->getFunction("fopen")->getReturnType(), ArgTys, true));
		Instruction *newInst = CallInst::Create(F.getParent()->getFunction("fprintf"), Args, "",next);
                i--;
		
		std::error_code EC;
      		raw_ostream *out = new raw_fd_ostream(path, EC);
		legacy::PassManager PM;
		ModulePass *m = createPrintModulePass(*out, "");
		PM.add(m);
		PM.run(*(F.getParent()));
	}

}
   return false;
   }
};
}
char Hy546llvmpass::ID = 0;
static RegisterPass<Hy546llvmpass> X("hy546llvmpass", "hy546 llvm Pass");
