import React, { useState, useEffect } from 'react';

function HookDemo() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    console.log("Count updated:", count);
  }, [count]);

  return (
    <div>
      <button onClick={() => setCount(count + 1)}>
        Click {count}
      </button>
    </div>
  );
}

export default HookDemo;
