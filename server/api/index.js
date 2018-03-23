import { Router } from 'express'

import users from './users'
import searchqueries from './searchqueries'

const router = Router()

// Add USERS Routes
router.use(users)
router.use(searchqueries)
export default router
