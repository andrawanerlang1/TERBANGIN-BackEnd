const router = require("express").Router();
const {
  login,
  register,
  getuserbyId,
  settings,
} = require("../controller/user");

// ==> Auth  <== //
router.post("/login", login);
router.post("/register", register);
// ==> User <==
router.get("/:id", getuserbyId);
router.patch("/settings/:id", settings);

module.exports = router;
