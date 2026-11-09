import React, { useState } from 'react';

const questions = [
  {
    q: "Capital of India?",
    options: ["Delhi", "Mumbai", "Kolkata"],
    answer: "Delhi"
  },
  {
    q: "2 + 2?",
    options: ["3", "4", "5"],
    answer: "4"
  }
];

function Quiz() {
  const [index, setIndex] = useState(0);
  const [score, setScore] = useState(0);
  const [showResult, setShowResult] = useState(false);

  const handleOption = (selected) => {
    if (selected === questions[index].answer)
      setScore(score + 1);

    const next = index + 1;

    if (next < questions.length)
      setIndex(next);
    else
      setShowResult(true);
  };

  return (
    <div>
      {!showResult ? (
        <div>
          <h3>{questions[index].q}</h3>

          {questions[index].options.map((opt, i) => (
            <button key={i} onClick={() => handleOption(opt)}>
              {opt}
            </button>
          ))}
        </div>
      ) : (
        <h2>Your Score: {score}/{questions.length}</h2>
      )}
    </div>
  );
}

export default Quiz;
