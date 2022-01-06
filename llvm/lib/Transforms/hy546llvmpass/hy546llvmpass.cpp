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
using namespace llvm;

#define DEBUG_TYPE "hello"

STATISTIC(HelloCounter, "Counts number of functions greeted");

namespace {
  // Hello - The first implementation, without getAnalysisUsage.
  struct Hy546llvmpass : public HY546LLVMPass {
    static char ID; // Pass identification, replacement for typeid
    Hy546llvmpass() : HY546LLVMPass(ID) {}

    /*bool runOnFunction(Function &F) override {
      //++Hy546llvmpassCounter;
      errs() << "Hy546llvmpass: ";
      errs().write_escaped(F.getName()) << '\n';
      return false;
    }*/

bool isPrintf(CallInst &C) override{
   auto *F = C.getCalledFunction();
   auto isPrintf = (F->getName() == "printf");
   if(isPrintf){
      errs() << "Hy546llvmpass: ";
      errs().write_escaped(F->getName()) << '\n';
   }
   return isPrintf;
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
