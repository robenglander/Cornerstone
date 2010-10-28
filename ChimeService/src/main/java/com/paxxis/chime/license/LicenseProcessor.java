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

package com.paxxis.chime.license;

import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;

import com.paxxis.chime.client.common.extension.ChimeExtension;
import com.paxxis.chime.extension.ChimeExtensionManager;
import com.paxxis.chime.service.ChimeConfiguration;

/**
 * 
 * @author Robert Englander
 *
 */
public class LicenseProcessor {

	class ExtensionValidator implements Runnable {

		public void run() {
			Logger.getLogger(LicenseProcessor.class).info("Revalidating extensions");
			List<ChimeExtension> extensions = ChimeExtensionManager.instance().getExtensions();
			for (ChimeExtension ext : extensions) {
				validate(ext);
			}
			
			scheduleValidation();
		}
	}

    public LicenseProcessor() {
    }

    private ScheduledExecutorService scheduledExecutor = null;
    private ChimeConfiguration config = null;
    private int validationFreq = 1440; // 1 day

    public void initialize() {
        scheduledExecutor = Executors.newScheduledThreadPool(1);
        scheduleValidation();
    }

    public void destroy() {
        scheduledExecutor.shutdown();
    }

    public void setChimeConfiguration(ChimeConfiguration config) {
        this.config = config;
    }

    public void validate(ChimeExtension ext) {
        String license = config.getStringValue("chime.licensing.file", null);
        ext.processLicense(license);
    }
    
    void scheduleValidation() {
        scheduledExecutor.schedule(new ExtensionValidator(), validationFreq, TimeUnit.MINUTES);
    }
}





