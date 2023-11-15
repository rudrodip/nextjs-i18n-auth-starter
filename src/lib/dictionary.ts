import 'server-only'
import type { Locale } from '@/config/i18n.config'

const dictionaries = {
  en: () => import('@/dictionaries/en.json').then(module => module.default),
  bn: () => import('@/dictionaries/bn.json').then(module => module.default)
}

export const getDictionary = async (locale: Locale) => dictionaries[locale]()