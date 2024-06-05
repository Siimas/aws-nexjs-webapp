

export default function Home() {
  const currentEnvironment = process.env.ENVIRONMENT

  return (
    <main className="flex justify-center items-center">
      <p>Current Environment: {currentEnvironment}</p> 
    </main>
  );
}
