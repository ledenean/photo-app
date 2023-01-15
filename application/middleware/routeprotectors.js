const { errorPrint, successPrint } = require("../helpers/debug/debugprinters");
const routerProtectors = {};


routerProtectors.userIsLoggedIn = function(req, res, next){
    if(req.session.username){
        successPrint("User is logged in");
        next();
    }
    else{
        errorPrint("User is not logged in!");
        req.flash('error', 'You must be logged in to create a Post!');
        req.session.save(err=>{
          res.redirect('/login');  
        })
    }
}

module.exports = routerProtectors;