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

import com.paxxis.cornerstone.scripting.parser.CSLRuleParser;
import com.paxxis.cornerstone.scripting.parser.CSLRuntime;
import com.paxxis.cornerstone.scripting.parser.ParseException;

/**
 * 
 * @author Rob Englander
 *
 */
public class CSLParserCreator implements ParserCreator {

    private ContextProvider contextProvider = null;
    
	@Override
	public void process(String code, RuleSet ruleSet) throws ParseException {
	    CSLRuleParser parser = CSLRuleParser.create(code);
	    parser.parseRuleSet(ruleSet);
	}

	@Override
	public CSLRuntime createRuntime() {
	    CSLRuntime rt = new CSLRuntime();
	    rt.setContextProvider(contextProvider);
	    return rt;
	}

	public void initialize() {
	    if (contextProvider == null) {
		throw new RuntimeException("ContextProvider property can't be null.");
	    }
	}
	
	@Override
	public void setContextProvider(ContextProvider provider) {
	    this.contextProvider = provider;
	}

}
