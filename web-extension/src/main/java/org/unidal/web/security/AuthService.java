package org.unidal.web.security;

import java.io.IOException;

public interface AuthService {
   public boolean login(AuthContext ctx) throws IOException;

   public boolean logout(AuthContext ctx) throws IOException;

   public boolean validate(AuthContext ctx, String permission) throws IOException;

   public boolean validate(AuthContext ctx) throws IOException;
}
