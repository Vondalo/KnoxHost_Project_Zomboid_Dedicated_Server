import React from 'react';
import { HashRouter as Router, Routes, Route } from 'react-router-dom';
import Layout from './components/Layout';
import Dashboard from './pages/Dashboard';
import Configuration from './pages/Configuration';
import Mods from './pages/Mods';
import Whitelist from './pages/Whitelist';
import Settings from './pages/Settings';
import Admin from './pages/Admin';

function App() {
  return (
    <Router>
      <Routes>
        <Route element={<Layout />}>
          <Route path="/" element={<Dashboard />} />
          <Route path="/config" element={<Configuration />} />
          <Route path="/mods" element={<Mods />} />
          <Route path="/whitelist" element={<Whitelist />} />
          <Route path="/admin" element={<Admin />} />
          <Route path="/settings" element={<Settings />} />
          <Route path="*" element={<div className="p-10 text-white">404 - Page Not Found. Path: {window.location.hash}</div>} />
        </Route>
      </Routes>
    </Router>
  );
}

export default App;
