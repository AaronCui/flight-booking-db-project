import { Router } from 'express'

import users from './users'
import searchqueries from './searchqueries'
import book from './book'
import analytics from './analytics'

const router = Router()

// Add USERS Routes
router.use(users)
router.use(searchqueries)
router.use(book)
router.use(analytics)
export default router
