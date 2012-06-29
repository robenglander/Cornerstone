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
 * @author Robert Englander
 */
public class TableIndexer extends RuleVariable {
    private static final long serialVersionUID = 1L;

    // the table variable
    private Table table = null;

    private IValue rowIndex;
    private IValue colIndex;

    public TableIndexer() {

    }
    
    /**
     * Constructs the indexer.
     */
    public TableIndexer(InstructionQueue queue,
                        Table table, IValue row, IValue col) {
        // we'll use the same name
        super(table.getName());

        this.table = table;
        this.rowIndex = row;
        this.colIndex = col;
    }

    public boolean isNull() {
    	return null == table;
    }
    
    public String getType() {
        return "Table Index";
    }

    public void resetValue() {
    }

    protected void setValue(IValue val) {
        table.setValue(rowIndex.valueAsInteger(), colIndex.valueAsInteger(), val.evaluate());
    }

    /**
     * Get the value of this variable as an object.
     * @return it's value
     */
    public Object valueAsObject() {
        return table.valueAt(rowIndex.valueAsInteger(), colIndex.valueAsInteger()).valueAsObject();
    }

    /**
     * Get the value of this variable as a string.
     * @return it's value
     */
    public String valueAsString() {
        return table.valueAt(rowIndex.valueAsInteger(), colIndex.valueAsInteger()).valueAsString();
    }

    public Double valueAsDouble() {
    	if (isNull()) {
    	    return null;
    	}
        return table.valueAt(rowIndex.valueAsInteger(), colIndex.valueAsInteger()).valueAsDouble();
    }

    public Integer valueAsInteger() {
    	if (isNull()) {
    	    return null;
    	}
        return table.valueAt(rowIndex.valueAsInteger(), colIndex.valueAsInteger()).valueAsInteger();
    }

    public Boolean valueAsBoolean() {
    	if (isNull()) {
    	    return null;
    	}
        return table.valueAt(rowIndex.valueAsInteger(), colIndex.valueAsInteger()).valueAsBoolean();
    }

    public IValue evaluate() {
        return table.valueAt(rowIndex.valueAsInteger(), colIndex.valueAsInteger());
    }

}
