const { partials } = require("handlebars");

module.exports = {

DEV_MODE: 'development',
IMAGES_PATH: '/images/',
FILE_NAME_PARAM : '&fileName=',
API_LISTING_PAGE: '/apis',  
API_FILE_PATH: '/apis/',
API_TEMPLATE_FILE_NAME: '/template?fileName=',
API_LANDING_PAGE_PATH: '/api/',
HEADER_PARTIAL_NAME: 'header',
HERO_PARTIAL_NAME: "hero",
API_MD_CONTENT_FILE_NAME: 'apiContent.md',
API_HBS_CONTENT_FILE_NAME: 'api-content.hbs',
API_CONTENT_PARTIAL_NAME: "api-content",
API_DEFINITION_FILE_NAME: 'apiDefinition.json',
PARTIAL_HEADER_FILE_NAME: 'header.hbs',
CHARSET_UTF8: "utf8",

MIME_TYPES: {
    HTML: 'text/html',
    JSON: 'application/json',
    YAML: 'application/yaml',
    TEXT: 'text/plain',
    CSS: 'text/css',
    JAVASCRIPT: 'application/javascript',
    PNG: 'image/png',
    JPEG: 'image/jpeg',
    SVG: 'image/svg+xml',
    PDF: 'application/pdf',
    OCTETSTREAM: 'application/octet-stream',
    CONTENT_TYPE: 'Content-Type',
    CONTENT_DISPOSITION: 'Content-Disposition',
    Cache_Control: 'Cache-Control',
},

FILE_EXTENSIONS: {
    HTML: '.html',
    JSON: '.json',
    CSS: '.css',
    JAVASCRIPT: '.js',
    PNG: '.png',
    JPEG: '.jpeg',
    JPG: '.jpg',
    SVG: '.svg',
    PDF: '.pdf',
    HBS: '.hbs',
    MD: '.md',
    GIF: '.gif',
    YAML: '.yaml',
    YML: '.yml',
}
}

