import { Router } from 'express'

import users from './users'
import flights from './flights'

const router = Router()

// Add USERS Routes
router.use(users)
router.use(flights)

export default router
