/*
* generated by Xtext
*/
package org.kermeta.language.sample.cellularautomata.rules.validation;
 
import java.util.ArrayList;
import java.util.List;

import org.eclipse.emf.ecore.EPackage;

public class AbstractInitJavaValidator extends org.kermeta.language.sample.cellularautomata.rules.validation.CoreJavaValidator {

	@Override
	protected List<EPackage> getEPackages() {
	    List<EPackage> result = new ArrayList<EPackage>();
	    result.add(EPackage.Registry.INSTANCE.getEPackage("http://rules/init/1.0"));
	    result.add(EPackage.Registry.INSTANCE.getEPackage("http://rules/core/1.0"));
	    result.add(EPackage.Registry.INSTANCE.getEPackage("http://geometry/1.0"));
		return result;
	}

}
