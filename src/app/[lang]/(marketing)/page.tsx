import { getDictionary } from "@/lib/dictionary"

export default async function Home() {
  const dictionary = await getDictionary("en")
  return (
    <main>
      {JSON.stringify(dictionary)}
      oy
    </main>
  )
}
