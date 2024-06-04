

export default function Home() {

  const currentEnvironment = process.env.ENVIRONMENT

  const test = process.env.ENVIRONMENT === "PRODUCTION" ? <div>PROD</div> : <div>DEV</div>

  return (
    <main className="flex justify-center items-center">
      <p>Current Environment: {currentEnvironment}</p>
      <br />
      {test}
    </main>
  );
}
