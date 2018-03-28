/* eslint no-console:0 */

console.log('Hello World from Webpacker')

import '../stylesheets/application.scss'

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /.js$/)
application.load(definitionsFromContext(context))