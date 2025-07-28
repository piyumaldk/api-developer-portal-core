/*
 * Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

try {
    const secret = require(process.cwd() + '/secret.json');
    
    if (secret.azureInsightsConnectionString) {
        const appInsights = require('applicationinsights');
        
        // Simple setup with Application Insights 2.9.6
        appInsights.setup(secret.azureInsightsConnectionString)
            .setAutoDependencyCorrelation(true)
            .setAutoCollectRequests(true)
            .setAutoCollectPerformance(false)
            .setAutoCollectExceptions(true)
            .setAutoCollectDependencies(true)
            .setAutoCollectConsole(false)
            .setUseDiskRetryCaching(true)
            .start();

        console.log('Application Insights 2.9.6 initialized successfully');
    } else {
        console.warn('Azure Insights connection string not found, telemetry disabled');
    }
} catch (error) {
    console.error('Failed to initialize Application Insights:', error.message);
    console.error('Stack trace:', error.stack);
}

module.exports = {};
