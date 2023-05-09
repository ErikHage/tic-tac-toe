import React from 'react';
import './App.css';

type ITodo = {
  id: number,
  title: string,
  completed: boolean,
};

type ITodos = {
  todos: ITodo[],
};

function App() {
  return <h1>Hello World</h1>
}

export default App;
