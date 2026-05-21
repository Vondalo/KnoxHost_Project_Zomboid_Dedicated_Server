import assert from 'assert/strict';
import { sanitizeReportValue, serializeErrorLike } from '../electron/handlers/errorReportUtils.js';

const sanitized = sanitizeReportValue({
    password: 'super-secret',
    nested: {
        webhookUrl: 'https://discord.com/api/webhooks/123/token',
        message: 'safe'
    },
    lines: ['one', 'two']
});

assert.equal(sanitized.password, '[redacted]', 'password-like keys should be redacted');
assert.equal(sanitized.nested.webhookUrl, '[redacted]', 'webhook-like keys should be redacted');
assert.equal(sanitized.nested.message, 'safe', 'non-sensitive fields should be preserved');

const serializedError = serializeErrorLike(new Error('boom'));
assert.equal(serializedError.message, 'boom', 'Error instances should preserve the message');
assert.equal(serializedError.name, 'Error', 'Error instances should preserve the name');

console.log('errorReportUtils.test.mjs passed');
