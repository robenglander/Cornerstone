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
package com.paxxis.cornerstone.database;

import com.paxxis.cornerstone.common.PasswordGenerator;

/**
 * 
 * @author Rob Englander
 *
 */
public abstract class DatabaseConnectionProvider {

	private PasswordGenerator passwordGenerator = null;

    public void setPasswordGenerator(PasswordGenerator generator) {
        passwordGenerator = generator;
    }

    public PasswordGenerator getPasswordGenerator() {
    	return passwordGenerator;
    }

    public abstract String getConnectionUrl(DatabaseConnectionPool pool);
    public abstract void postConnect(DatabaseConnectionPool pool, DatabaseConnection database) throws DatabaseException;
    public abstract void onShutdown(DatabaseConnectionPool pool);
    public abstract String getName();
    public abstract int getDefaultPort();
}
