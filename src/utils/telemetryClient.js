// Application Insights client - initialized in init.js
let telemetryClient = null;

try {
    const appInsights = require('applicationinsights');
    telemetryClient = appInsights.defaultClient;
    
    if (!telemetryClient) {
        console.warn('Application Insights client not available, creating mock client');
        telemetryClient = {
            trackEvent: () => {},
            trackException: () => {},
            trackTrace: () => {},
            flush: () => {}
        };
    }
} catch (error) {
    console.error('Failed to get Application Insights client:', error.message);
    // Create a mock client to prevent errors
    telemetryClient = {
        trackEvent: () => {},
        trackException: () => {},
        trackTrace: () => {},
        flush: () => {}
    };
}

module.exports = {
    telemetryClient
};
