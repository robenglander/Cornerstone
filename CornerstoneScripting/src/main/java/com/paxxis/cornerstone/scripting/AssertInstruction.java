/*
 * Copyright 2010 the original author or authors.
 * Copyright 2009 Paxxis Technology LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.paxxis.cornerstone.scripting;

/**
 * 
 * @author Rob Englander
 *
 */
public class AssertInstruction extends Instruction {
    private static final long serialVersionUID = 1L;

    private IValue failMessage;

    private IValue condition;
    
    // the rule itself
    private Rule rule;
    
    public AssertInstruction(Rule rule, IValue condition, IValue failMessage) {
	this.rule = rule;
	this.condition = condition;
	this.failMessage = failMessage;
    }

    public boolean process(InstructionQueue queue) {
	if (false == condition.valueAsBoolean()) {
	    throw new RuntimeException(failMessage.valueAsString());
	} else {
	    return true;
	}
    }
}