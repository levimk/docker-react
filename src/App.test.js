import React from 'react';
import { render } from '@testing-library/react';
import App from './App';

test('reruns the test suite', () => {
  const { getByText } = render(<App />);
  const linkElement = getByText(/learn react/i);
  expect(linkElement).toBeInTheDocument();
});
