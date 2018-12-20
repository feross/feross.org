#!/usr/bin/env node

const gitPullOrClone = require('git-pull-or-clone')
const path = require('path')
const series = require('run-series')

const MODULES = [
  ['git@github.com:feross/ahh-windows.git', 'ahh-windows'],
  ['git@github.com:feross/detect-proxy.git', 'detect-proxy'],
  ['git@github.com:feross/Facebook-Like-Everything.git', 'facebook-like-everything'],
  ['git@github.com:feross/Fullscreen-API-Attack.git', 'fullscreen-api-attack'],
  ['git@github.com:feross/md5-password-cracker.js.git', 'md5-password-cracker.js'],
  ['git@github.com:feross/Nim.js.git', 'nim.js'],
  ['git@github.com:feross/Selective-Attention-Test.git', 'selective-attention-test'],
  ['git@github.com:feross/SuperTranslate.git', 'instant.io'],
  ['git@github.com:feross/webcam-spy.git', 'webcam-spy']
]

series(MODULES.map(mod => {
  const url = mod[0]
  const outPath = path.join(__dirname, '..', 'hacks', mod[1])
  return (cb) => gitPullOrClone(url, outPath, cb)
}), (err) => {
  if (err) throw err
  console.log('hacks/ folder is up-to-date!')
})
