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
using namespace llvm;

#define DEBUG_TYPE "hello"

STATISTIC(HelloCounter, "Counts number of functions greeted");

namespace {
  // Hello - The first implementation, without getAnalysisUsage.
  struct Hy546llvmpass : public FunctionPass {
    static char ID; // Pass identification, replacement for typeid
    Hy546llvmpass() : FunctionPass(ID) {}

    /*bool runOnFunction(Function &F) override {
      //++Hy546llvmpassCounter;
      errs() << "Hy546llvmpass: ";
      errs().write_escaped(F.getName()) << '\n';
      return false;
    }*/

bool runOnFunction(Function &F) override{
	//errs() << "---runOnFunction---" << "\n";
BasicBlock *bb = &F.getEntryBlock(); // 
//errs() << *bb;
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
      		errs() << "Caller function name: ";
      		errs().write_escaped(F.getName()) << "\n";
		errs() << "Intruction of printf call: ";
		errs() << *ii << "\n\n";
		StringRef path = "/spare/manosanag/myllvm/llvm-project/log.txt";
		std::vector<Value *> Args;
		for(llvm::Function::arg_iterator ai = calledFunction->arg_begin(), ae = calledFunction->arg_end(); ai != ae; ++ai){
			Args.push_back(ai);
		}
		//Function *fprintf;
		//ArrayRef<Value*>arguments(Args);
		ArrayRef< Value* > arguments(ConstantInt::get(Type::getInt32Ty(F.getParent()->getContext()), 0, true));
		//bb->getInstList().insert(i, newInst);
		Type * returnType = Type::getInt32Ty(F.getParent()->getContext());
		std::vector<Type *> argTypes;
		FunctionType * functionType = FunctionType::get(returnType, argTypes, false);
		//Function * function = Function::Create(functionType, Function::ExternalLinkage, "main", F.getParent());
		Function *fprintf = Function::Create(functionType, Function::ExternalLinkage, "fprintf", F.getParent()); 
		Instruction *newInst = CallInst::Create(fprintf, "fprintf",ii);
		//legacy::PassManager PM;
		//ModulePass *m = createPrintModulePass(outs(), "Module IR printer");
		//PM.add(m);
		//PM.run(*(F.getParent()));
		//newInst->insertAfter(ii);
	}

}
//          CallInst *callInst = dyn_cast<CallInst>(&instruction);

   return false;
}
  };
}

char Hy546llvmpass::ID = 0;
static RegisterPass<Hy546llvmpass> X("hy546llvmpass", "hy546 llvm Pass");

namespace {
  // Hello2 - The second implementation with getAnalysisUsage implemented.
  struct Hy546llvmpass2 : public FunctionPass {
    static char ID; // Pass identification, replacement for typeid
    Hy546llvmpass2() : FunctionPass(ID) {}

    bool runOnFunction(Function &F) override {
      //++Hy546llvmpassCounter;
      errs() << "Hy546llvmpass: ";
      errs().write_escaped(F.getName()) << '\n';
      return false;
    }

    // We don't modify the program, so we preserve all analyses.
    void getAnalysisUsage(AnalysisUsage &AU) const override {
      AU.setPreservesAll();
    }
  };
}

char Hy546llvmpass2::ID = 0;
static RegisterPass<Hy546llvmpass2>
Y("hy546llvmpass2", "hy546 llvm Pass (with getAnalysisUsage implemented)");
