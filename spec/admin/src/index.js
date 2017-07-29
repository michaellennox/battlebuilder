import Vue from 'vue';

Vue.config.productionTip = false;

const testsContext = require.context('./tests', true, /\.spec$/);
testsContext.keys().forEach(testsContext);
