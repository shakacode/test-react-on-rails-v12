// Do not put this file in the "packs" directory as we don't want this used
// for the client bundle
import ReactOnRails from 'react-on-rails';

import HelloWorld from './HelloWorld/components/HelloWorld';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  HelloWorld,
});
