function requireAuth(req, res, next) {
  if (!req.session.user) return res.redirect("/");
  return next();
}

function requireRole(role) {
  return (req, res, next) => {
    if (!req.session.user) return res.redirect("/");
    if (req.session.user.role !== role) return res.status(403).render("message", { title: "Forbidden", message: "Access denied." });
    return next();
  };
}

module.exports = { requireAuth, requireRole };
