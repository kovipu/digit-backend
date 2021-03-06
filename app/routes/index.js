const router = require('express-promise-router')()
const passport = require('passport')
const { authenticateLocal } = require('../middlewares/auth')
const { validateLogin } = require('../models/userAccount/userAccountValidators')
const authenticateJwt = passport.authenticate('jwt', { session: false })

router.post('/login', validateLogin(), authenticateLocal)
router.use('/registration', require('./auth'))
router.use('/intra', authenticateJwt, require('./intra'))
router.use('/facebook', require('./socialMedia'))
router.use(require('./publicSiteContent'))

module.exports = router
