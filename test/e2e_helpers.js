const fs = require('fs');
const path = require('path');

function ensureDir(p) {
  if (!fs.existsSync(p)) fs.mkdirSync(p, { recursive: true });
}

function timestamp() { return new Date().toISOString().replace(/[:.]/g, '-'); }

function artifactPath(name) {
  const dir = path.join(process.cwd(), 'test', 'artifacts');
  ensureDir(dir);
  return path.join(dir, `${timestamp()}-${name}`);
}

module.exports = { ensureDir, timestamp, artifactPath };
